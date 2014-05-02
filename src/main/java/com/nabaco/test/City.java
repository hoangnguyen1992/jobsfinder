package com.nabaco.test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "cities")
public class City {
 
 @Id
 @SequenceGenerator(name="cityId_seq", sequenceName="city_id_seq")
 @GeneratedValue(strategy = GenerationType.SEQUENCE ,generator="cityId_seq")
 private Long id;
 
 @Column(nullable = true)
 private String name;

 @Column(nullable = true)
 private Integer regionId;
 
 @Column(nullable=true)
 private String country;
 
 public String getCountry() {
  return country;
 }

 public void setCountry(String country) {
  this.country = country;
 }

 public String getName() {
  return name;
 }

 public void setName(String name) {
  this.name = name;
 }

 public Integer getRegionId() {
  return regionId;
 }

 public void setRegionId(Integer regionId) {
  this.regionId = regionId;
 }

 public Long getId() {
  return id;
 }

 public void setId(Long id) {
  this.id = id;
 }

}