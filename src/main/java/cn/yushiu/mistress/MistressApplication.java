package cn.yushiu.mistress;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

/**
 * @author Administrator
 */
@EnableCaching
@SpringBootApplication
@MapperScan("cn.yushiu.mistress.mapper")
public class MistressApplication {

    public static void main(String[] args) {
        SpringApplication.run(MistressApplication.class, args);
    }

}
