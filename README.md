# ft_services

## 1. 과제 설명
### 개요
- ft_services는 쿠버네티스(Kubernetes, k8s)를 활용하여 다양한 서비스들을 배포해보는 과제입니다.<br/>
- 쿠버네티스란?<br/>
: 다양한 컨테이너 운영환경 중 가장 널리 사용되는 솔루션입니다.
- 컨테이너 운영환경이란?<br/>
: 개발자로 하여금 컨테이너 운영을 간편하게 할 수 있도록 등장한 기술입니다.

### 목표
- 쿠버네티스의 구조와 원리를 이해합니다.
- 쿠버네티스에 적용할 yaml 파일 작성법을 숙지합니다.
- 쿠버네티스 클러스터에 배포될 다양한 서비스들(Nginx, Wordpress, phpMyAdmin, MySQL, Grafana, InfluxDB, FTPS)의 설치 및 배포 방법을 숙지합니다.

### 기술 스택
- Kubernetes, Docker, Nginx, MySQL

### 제작 기간
- 2021.04 ~ 2021.05

## 2. 서비스 배포 화면
- 배포 상태
<img width="1177" alt="Screen Shot 2021-06-07 at 4 48 50 PM" src="https://user-images.githubusercontent.com/59330163/121011015-1804eb80-c7d1-11eb-99d8-94da88a26154.png">
- Nginx 서버 초기화면
<img width="967" alt="Screen Shot 2021-06-07 at 8 46 24 PM" src="https://user-images.githubusercontent.com/59330163/121011344-7500a180-c7d1-11eb-8fb5-cbacf04ebfaa.png">
- Wordpress 초기화면
<img width="1421" alt="Screen Shot 2021-06-07 at 8 47 10 PM" src="https://user-images.githubusercontent.com/59330163/121011424-8ea1e900-c7d1-11eb-8d25-869db8e549a4.png">
- phpMyAdmin 초기화면
<img width="1370" alt="Screen Shot 2021-06-07 at 8 47 50 PM" src="https://user-images.githubusercontent.com/59330163/121011491-a5e0d680-c7d1-11eb-8359-f4cc9f613784.png">
- phpMyAdmin으로 본 wordpress_db 데이터베이스의 wp_posts 테이블
<img width="2560" alt="Screen Shot 2021-06-07 at 4 38 47 PM" src="https://user-images.githubusercontent.com/59330163/121010907-f3a90f00-c7d0-11eb-9def-15b6128290e0.png">
- Grafana 초기화면
<img width="2560" alt="Screen Shot 2021-06-07 at 4 38 59 PM" src="https://user-images.githubusercontent.com/59330163/121010917-f73c9600-c7d0-11eb-814e-601e9bf7d781.png">
- Grafana가 생성한 Dashboard
<img width="2560" alt="Screen Shot 2021-06-07 at 4 39 42 PM" src="https://user-images.githubusercontent.com/59330163/121010928-fb68b380-c7d0-11eb-916c-67b9cc8c5883.png">
- Grafana로 본 Nginx 상태 패널
<img width="2560" alt="Screen Shot 2021-06-07 at 4 39 48 PM" src="https://user-images.githubusercontent.com/59330163/121010940-01f72b00-c7d1-11eb-9207-91f2fc3749c8.png">
- FTPS client 프로그램(FileZilla)를 활용한 FTPS 서버 연결
<img width="1204" alt="Screen Shot 2021-06-07 at 4 48 02 PM" src="https://user-images.githubusercontent.com/59330163/121010984-0c192980-c7d1-11eb-95d4-2a619cfa672d.png">

## 3. 서비스 배포 과정
