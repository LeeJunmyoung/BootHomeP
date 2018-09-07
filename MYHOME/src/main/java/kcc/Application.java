package kcc;

import java.nio.charset.Charset;

import javax.servlet.Filter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.filter.CharacterEncodingFilter;

@SpringBootApplication
@EnableScheduling
@ComponentScan(basePackages="kcc")
public class Application {
//주석
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
	
	/*
	@Bean 
	public EmbeddedServletContainerCustomizer containerCustomizer() {
		
	}*/
	
	/*
	@Bean
    public EmbeddedServletContainerCustomizer customizeContainerr() {
		System.out.println("errorpage");
		
        return new CustomizedContainer();
    }
	
	private static class CustomizedContainer implements EmbeddedServletContainerCustomizer {
        @Override
        public void customize(ConfigurableEmbeddedServletContainer container) {
        	System.out.println("errorpage2");
        	
            container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/404.html"));
            container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.html"));
        }
    }
    */
}
