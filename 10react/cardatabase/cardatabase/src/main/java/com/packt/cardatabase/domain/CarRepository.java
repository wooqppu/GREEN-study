package com.packt.cardatabase.domain;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

// Car 엔티티 클래스의 리포지터리 
// ID필드의 형식은 Long타입으로 지정되있음 
@RepositoryRestResource
public interface CarRepository extends CrudRepository<Car, Long> {
	// 브랜드로 자동차를 검색
	// @Query 어노테이션 이용하면 SQL문으로 쿼리를 만들 수 있음 '
	@Query("select c from Car c where c.brand = ?1") 
	List<Car> findByBrand(String brand);
	
	@Query("select c from Car c where c.brand like %?1")
	List<Car> findByBrandEndEith(String brand);
	
	// 색상으로 자동차를 검색 
	List<Car> findByColor(String color);
	
	// 년도로 자동차를 검색 
	List<Car> findByYear(int year);
	
	// 브랜드와 모델로 자동차를 검색 - And 사용
	List<Car> findByBrandAndModel(String brand, String model);
	
	// 브랜드나 색상으로 자동차를 검색 - Or 사용
	List<Car> findByBrandOrModel(String brand, String color);
	
	// 정렬하기 - OrderBy 필드명 오름차순 지정 / Asc, Desc
	List<Car> findByBrandOrderByYearAsc(String brand);
	
}
