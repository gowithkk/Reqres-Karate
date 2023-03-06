# Reqres-Karate
Testing [Reqres API](https://reqres.in/) using Karate framework

## 
All APIs are tested in files under folder [feature](https://github.com/gowithkk/Reqres-Karate/tree/main/src/test/java/reqresApp)

[Login.feature](https://github.com/gowithkk/Reqres-Karate/blob/main/src/test/java/reqresApp/feature/Login.feature) tests:
| Methods        | Function           | State  | HTTP Code  |
| ------------- |:-------------| :-----| -----:|
| POST     | Login      | Successful | 200 | 
| POST     | Login      |   Unsuccessful | 400 | 

[Register.feature](https://github.com/gowithkk/Reqres-Karate/blob/main/src/test/java/reqresApp/feature/Register.feature) tests:
| Methods        | Function           | State  |HTTP Code  |
| ------------- |:-------------| :-----| -----:|
| POST     | Register      | Successful | 200 | 
| POST     | Register      |   Unsuccessful | 400 |

[Resources.feature](https://github.com/gowithkk/Reqres-Karate/blob/main/src/test/java/reqresApp/feature/Resources.feature) tests:
| Methods        | Function           | State  | HTTP Code |
| ------------- |:-------------|:-----| -----:|
| GET     | List Resources      | Successful | 200  | 
| GET     | List a Single Resource     | Successful  | 200 | 
| GET     | List a Single Resource Not Found    | Unsuccessful  | 404 |


[Users.feature](https://github.com/gowithkk/Reqres-Karate/blob/main/src/test/java/reqresApp/feature/Users.feature) tests:
| Methods        | Function           | State  |HTTP Code |
| ------------- |:-------------|:-----| -----:|
| GET     | List Users      | Successful | 200  | 
| GET     | List a Single User     | Successful  | 200 | 
| GET     | List a Single User Not Found    | Unsuccessful  | 404 |
| POST     | Create    | Successful  | 201 |
| PUT     | Update    | Successful  | 200 | 
| PATCH     | Update    | Successful  | 200 | 
| DELETE     | Delete    | Successful  | 204 | 
| GET     | Delayed Response    | Successful  | 204, 200 | 

## Usage
Please ensure that you have Java and Maven installed before excuting the following:

```
git clone https://github.com/gowithkk/Reqres-Karate
mvn test
```
Karate reports can be accessed under target/karate-reports-XXXX/karate-summary.html once test run is completed.

## Directory
<img width="500" alt="Screenshot 2023-03-06 at 8 30 17 pm" src="https://user-images.githubusercontent.com/37802676/223070763-5bab907a-06c0-4228-beb2-5c1230d934cf.png">
