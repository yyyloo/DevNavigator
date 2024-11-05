from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from geopy.geocoders import Nominatim

app = FastAPI()

geolocator = Nominatim(user_agent="github_user_location_service")

class LocationRequest(BaseModel):
    location: str
# 定义地理位置查询路由

# 定义地理位置查询路由
@app.get("/get_country")
async def get_country(location: str):
    # 获取地理编码信息
    loc = geolocator.geocode(location)

    if loc:
        # 使用 .raw 属性从 location 获取国家信息
        country = loc.raw.get('display_name').split(",")[-1].strip()
        # if country and not all('\u4e00' <= c <= '\u9fff' for c in country):  # 检查是否为中文
        #     country = translator.translate(country, dest='zh-cn').text
        return {"country": country}
    else:
        raise HTTPException(status_code=404, detail="Location not found.")