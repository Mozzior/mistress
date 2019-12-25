package cn.yushiu.mistress;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@EnableCaching
@SpringBootApplication
public class MistressApplication {

    public static void main(String[] args) {
        SpringApplication.run(MistressApplication.class, args);
    }

}
