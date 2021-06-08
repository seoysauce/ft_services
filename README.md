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
> Mac OS 기입니다.

### 개발 환경 구축
- `brew install minikube` : minikube 설치
- `minikube start --driver=virtualbox` : virtualbox기반으로 minikube 실행

### MetalLB 설치
- MetalLB는 BareMetalLoadBalancer의 약자로서, 클라우드 벤더의 ip제공 없이 Loadbalancer type의 서비스를 제공할 수 있습니다.

### A. Nginx 설치
#### Nginx란?
- Nginx는 동시접속 처리에 특화된 웹 서버 프로그램입니다.
- 프로세스를 늘리지 않기 때문에 컴퓨터 자원을 상대적으로 적게 사용하고, 빠른 처리가 가능합니다.

#### Nginx 설치
> Container로 배포할 Nginx의 image를 생성합니다.

- Nginx 패키지를 설치합니다.
- https로의 redirection기능 추가를 위해 Openssl을 활용하여 인증서를 생성합니다.
- Nginx 서버 설정 파일인 default.conf 파일에 location 제어문을 추가하여 `/wordpress` redirection 기능과 `/phpmyadmin` reverse proxy 기능을 추가합니다.
- Container 내부의 프로세스 상태 확인을 위해 Supervisor를 설치하여 실행합니다.
- pod의 다양한 데이터를 받아서 InfluxDB에 저장하기 위해 telegraf를 설치하여 실행합니다.
- Nginx는 기본적으로 background로 실행되기 때문에 foreground로 설정하여 실행합니다.<br/>
(background로 실행 시에 Container는 Nginx 프로세스를 인지하지 못함)

### B. Wordpress 설치
#### Wordpress란?
- Wordpress는 세계 최대의 오픈소스 저작물 관리 시스템입니다. 우리나라의 서울특별시 홈페이지가 Wordpress기반으로 만들어졌습니다.

#### Wordpress 설치
> Container로 배포할 Wordpress의 image를 생성합니다.

- alpine에서 Wordpress 설치를 위해 제공되는 패키지가 없기 때문에 `https://wordpress.org/latest.tar.gz`링크에서 직접 다운로드 받습니다.
- Wordpress 구동에 필요한 php 모듈을 설치합니다.
- Nginx 설정 파일인 default.conf 파일에 location 제어문을 추가하여 php-fpm으로의 redirection 기능을 넣어줍니다.<br/>
(동적 웹사이트로의 요청을 처리하기 위함)
- Container 내부의 프로세스 상태 확인을 위해 Supervisor를 설치하여 실행합니다.
- pod의 다양한 데이터를 받아서 InfluxDB에 저장하기 위해 telegraf를 설치하여 실행합니다.
- wordpress.yaml 파일 내에서 configmap을 추가하여 데이터베이스와의 연동을 위한 wp-config.php 파일을 만듭니다.

### C. phpMyAdmin 설치
#### phpMyAdmin이란?
- phpMyAdmin은 MySQL 데이터베이스를 월드 와이드 웹 상에서 관리할 목적으로 PHP로 작성한 오픈 소스 도구입니다.

#### phpMyAdmin 설치
> Container로 배포할 phpMyAdmin의 image를 생성합니다.

- alpine에서 phpMyAdmin 설치를 위해 제공되는 패키지가 없기 때문에`https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz`링크에서 직접 다운로드 받습니다.
- phpMyAdmin 구동에 필요한 php 모듈을 설치합니다.
- Nginx 설정 파일인 default.conf 파일에 location 제어문을 추가하여 php-fpm으로의 redirection 기능을 넣어줍니다.<br/>
(동적 웹사이트로의 요청을 처리하기 위함)
- Container 내부의 프로세스 상태 확인을 위해 Supervisor를 설치하여 실행합니다.
- pod의 다양한 데이터를 받아서 InfluxDB에 저장하기 위해 telegraf를 설치하여 실행합니다.
- MySQL 서버와의 연동을 위해 config.inc.php 파일을 수정합니다.

### D. MySQL 설치
#### MySQL이란?
- MySQL은 오픈 소스의 관계형 데이터베이스 관리 시스템(RDBMS)입니다.

#### MySQL 설치
> Container로 배포할 MySQL의 image를 생성합니다.

- 이번 과제에서는 MySQL 서버와 클라이언트가 같은 pod내에서 관리되기 때문에 서버와 클라이언트를 모두 설치합니다.
- MySQL 서버 설정을 위해 my.cnf 디렉토리에 있는 server.conf 파일을 수정합니다.
- pod의 다양한 데이터를 받아서 InfluxDB에 저장하기 위해 telegraf를 설치하여 실행합니다.
- Container 내부의 프로세스 상태 확인을 위해 mysql.yaml파일에 livenessProbe 기능을 추가합니다.
- pod가 재생성되어도 데이터베이스의 데이터 유지를 위해 mysql.yaml파일에 PVC(Persistent Volume Claim)를 선언합니다.

### E. Grafana 설치
#### Grafana란?
- Grafana는 메트릭 데이터를 시각화하는데 가장 최적화된 대시보드를 제공하는 오픈소스 메트릭 데이터 시각화 도구입니다.

#### Grafana 설치
> Container로 배포할 Grafana의 image를 생성합니다.

- Grafana 패키지를 설치합니다.
- Container 내부의 프로세스 상태 확인을 위해 Supervisor를 설치하여 실행합니다.
- pod의 다양한 데이터를 받아서 InfluxDB에 저장하기 위해 telegraf를 설치하여 실행합니다.

### F. InfluxDB 설치
#### InfluxDB란?
- InfluxDB는 인플럭스데이터가 개발한 오픈 소스 시계열 데이터베이스(TSDB)입니다.

#### InfluxDB 설치
> Container로 배포할 InfluxDB의 image를 생성합니다.

- InfluxDB 패키지를 설치합니다.
- Container 내부의 프로세스 상태 확인을 위해 Supervisor를 설치하여 실행합니다.
- pod의 다양한 데이터를 받아서 InfluxDB에 저장하기 위해 telegraf를 설치하여 실행합니다.(host는 localhost로 설정)
- pod가 재생성되어도 데이터베이스의 데이터 유지를 위해 influxdb.yaml파일에 PVC(Persistent Volume Claim)를 선언합니다.

### G. FTPS 설치
#### FTPS란?
- FTP(File Transfer Protocol)는 TCP/IP 프로토콜을 가지고 서버와 클라이언트 사이의 파일 전송을 하기 위한 프로토콜입니다.
- FTPS는 기존의 FTP에 전송 계층 보안(TLS)과 보안 소켓 계층(SSL) 암호화 프로토콜에 대한 지원이 추가된 프로토콜입니다.

#### FTPS 설치
> Container로 배포할 FTPS의 image를 생성합니다.

- FTPS 서버 프로그램인 vsftpd 패키지를 설치합니다.
- pod의 다양한 데이터를 받아서 InfluxDB에 저장하기 위해 telegraf를 설치하여 실행합니다.
- Openssl을 활용하여 인증서를 생성합니다.
- Container 내부의 프로세스 상태 확인을 위해 ftps.yaml파일에 livenessProbe 기능을 추가합니다.

## For details : https://velog.io/@du0928/ftservices
