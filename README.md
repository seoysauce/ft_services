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

### 수행 기간
- 2021.04 ~ 2021.05

## 2. 서비스 배포 화면
### 배포 상태
<img width="1177" alt="Screen Shot 2021-06-07 at 4 48 50 PM" src="https://user-images.githubusercontent.com/59330163/121011015-1804eb80-c7d1-11eb-99d8-94da88a26154.png">

## 3. 서비스 배포 과정
> Mac OS 기준입니다.

### 개발 환경 구축
- `brew install minikube` : minikube 설치
- `minikube start --driver=virtualbox` : virtualbox기반으로 minikube 실행

### MetalLB 설치
- MetalLB는 BareMetalLoadBalancer의 약자로서, 클라우드 벤더들의 ip제공 없이 Loadbalancer type의 서비스를 제공할 수 있습니다.

### Nginx 설치 및 배포
#### Nginx란?
- Nginx는 동시접속 처리에 특화된 웹 서버 프로그램입니다.
- 프로세스를 늘리지 않기 때문에 컴퓨터 자원을 상대적으로 적게 사용하고, 빠른 처리가 가능합니다.
