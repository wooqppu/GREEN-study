package com.packt.cardatabase.domain;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
	// null 예외를 방지하기 위해 Optional을 반환해줌 
	Optional<User> findByUsername(String username);
}
