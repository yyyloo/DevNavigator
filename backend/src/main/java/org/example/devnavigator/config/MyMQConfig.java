package org.example.devnavigator.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.Exchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MyMQConfig {

    /* 容器中的Queue、Exchange、Binding 会自动创建（在RabbitMQ）不存在的情况下 */

    /**
     * 死信队列
     *
     * @return
     */

    /**
     * 普通队列
     *
     * @return
     */
    @Bean
    public Queue devNavigatorESQueue() {

        Queue queue = new Queue("dev_navigator.es.queue", true, false, false);

        return queue;
    }

    @Bean
    public Queue countryPredictQueue() {

        Queue queue = new Queue("country.predict.queue", true, false, false);

        return queue;
    }



    /**
     * TopicExchange
     *
     * @return
     */
    @Bean
    public Exchange devNavigatorExchange() {
        /*
         *   String name,
         *   boolean durable,
         *   boolean autoDelete,
         *   Map<String, Object> arguments
         * */
        return new TopicExchange("dev_navigator-exchange", true, false);

    }


    @Bean
    public Binding countryPredictBinding() {
        /*
         * String destination, 目的地（队列名或者交换机名字）
         * DestinationType destinationType, 目的地类型（Queue、Exhcange）
         * String exchange,
         * String routingKey,
         * Map<String, Object> arguments
         * */
        return new Binding("country.predict.queue",
                Binding.DestinationType.QUEUE,
                "dev_navigator-exchange",
                "predict.country.key",
                null);
    }

    @Bean
    public Binding devNavigatorESBinding() {
        /*
         * String destination, 目的地（队列名或者交换机名字）
         * DestinationType destinationType, 目的地类型（Queue、Exhcange）
         * String exchange,
         * String routingKey,
         * Map<String, Object> arguments
         * */
        return new Binding("dev_navigator.es.queue",
                Binding.DestinationType.QUEUE,
                "dev_navigator-exchange",
                "es.key",
                null);
    }



}