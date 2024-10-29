package org.example.devnavigator.listener;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.rabbitmq.client.Channel;
import org.example.devnavigator.entity.DeveloperProfileEntity;
import org.example.devnavigator.entity.DomainEntity;
import org.example.devnavigator.esdao.PostEsDao;
import org.example.devnavigator.mapper.DomainMapper;
import org.example.devnavigator.to.DeveloperEsTo;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@RabbitListener(queues = "dev_navigator.es.queue")
@Service
public class ESListener {

    @Autowired
    RabbitTemplate rabbitTemplate;
    @Autowired
    DomainMapper domainMapper;
    @Autowired
    PostEsDao postEsDao;

    @RabbitHandler
    public void listener(DeveloperProfileEntity developerProfileEntity, Channel channel, Message message) throws IOException {

        DeveloperEsTo developerEsTo = new DeveloperEsTo();
        BeanUtils.copyProperties(developerProfileEntity, developerEsTo);
        List<DomainEntity> languages = domainMapper.selectList(new QueryWrapper<DomainEntity>().eq("github_username", developerEsTo.getGithubUsername()));
        List<String> collect = languages.stream().map(DomainEntity::getLanguage).collect(Collectors.toList());
        developerEsTo.setLanguages(collect);
        DeveloperEsTo save = postEsDao.save(developerEsTo);
        System.out.println(2222);
        if (save.getId() != null) {
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        }

    }






}