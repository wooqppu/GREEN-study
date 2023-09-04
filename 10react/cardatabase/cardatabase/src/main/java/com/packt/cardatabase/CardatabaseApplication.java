package com.packt.cardatabase;

import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.packt.cardatabase.domain.Car;
import com.packt.cardatabase.domain.CarRepository;
import com.packt.cardatabase.domain.Owner;
import com.packt.cardatabase.domain.OwnerRepository;
import com.packt.cardatabase.domain.User;
import com.packt.cardatabase.domain.UserRepository;

// @EnabledAutoConfiguration : 스프링부트 자동 구성을 활성화 
// @ComponentScan : 스프링부트 컴포넌트 검색으로 애플리케이션의 컴포넌트를 찾음 
// @Configuration : 빈(bean) 정의의 원본으로 쓸 수 있는 클래스임을 정의함
// 위 3개의 어노테이션을 조합한 것이 @SpringBootApplication

@SpringBootApplication
public class CardatabaseApplication implements CommandLineRunner {

	private static final Logger logger = LoggerFactory.getLogger(CardatabaseApplication.class);
	
	// 의존성 주입 
	@Autowired
	private CarRepository repository;
	
	// 소유자 리포지토리 의존성 주입 
	@Autowired
	private OwnerRepository orepository;
	
	@Autowired
	private UserRepository urepository;
	
	private BCryptPasswordEncoder pwencoder = new BCryptPasswordEncoder();
	
	
	public static void main(String[] args) {
		// 이 코드를 추가하면 애플리케이션이 재시작됨 
		SpringApplication.run(CardatabaseApplication.class, args);
	
		logger.info("애플리케이션 시작");
	}

	@Override
	public void run(String... args) throws Exception {
		
		Owner owner1 = new Owner("그린", "김");
		Owner owner2 = new Owner("블루", "이");
		Owner owner3 = new Owner("지아", "박");
		
		// insert 
		// saveAll : 여러 데이터 저장 
		orepository.saveAll(Arrays.asList(owner1, owner2, owner3));
		
		repository.save(new Car("Ford", "Mustang", "red", "ADF-1211", 2021, 59000, owner1));
		repository.save(new Car("Nissan", "Leaf", "white", "SSJ-1234", 2020, 29000, owner2));
		repository.save(new Car("Toyota", "Prius", "black", "KKO-1222", 2022, 32000, owner3));		
		repository.save(new Car("현대", "소나타", "black", "KKO-1222", 2022, 32000, owner3));		
		repository.save(new Car("현대", "그랜저", "black", "KKO-1222", 2022, 32000, owner3));		
	
		// 모든 레코드를 가지고와서 콘솔에 로깅 
		for(Car car : repository.findByBrand("현대")) {
			logger.info(car.getBrand() + " " + car.getModel());
		}
		
		// 사용자 이름 user 암호 user
		urepository.save(new User("user", pwencoder.encode("user"), "USER"));
		urepository.save(new User("admin", pwencoder.encode("admin"), "ADMIN"));
	
	}

}
