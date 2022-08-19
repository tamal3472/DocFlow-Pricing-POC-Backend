# README

## To setup the project your local system needs you need to have

* Ruby version
```bash
 ruby '2.7.5'
```

* Rails version
```bash
 gem 'rails', '~> 6.0.1'
```

* Database
```bash
 latest postgres
```

** To run the project

- Clone the repository

  ```bash
    https://github.com/tamal3472/DocFlow-Pricing-POC-Backend.git
  ```

- Run command

  ```bash
    gem install bundler 2.3.19
    bundle install
    rails db:create
    rails db:migrate
    rails db:seed
    rails s
  ```
Server should now up and running at: http://localhost:3000

## **API Documentation**
:bangbang:  Request format and responses are in JSON

- Retrieve Plans
 ```bash
  GET  localhost:3000/plans
```
The expected response will be
 ```bash
  {
    "plans": [
      {
          "id": 1,
          "name": "solo",
          "user_limit": 1,
          "price_monthly": "2.0",
          "price_yearly": "2.0",
          "additional_user_fee": null
      },
      {
          "id": 2,
          "name": "startup",
          "user_limit": 5,
          "price_monthly": "20.0",
          "price_yearly": "18.0",
          "additional_user_fee": "7.0"
      },
      {
          "id": 3,
          "name": "enterprise",
          "user_limit": 20,
          "price_monthly": "60.0",
          "price_yearly": "55.0",
          "additional_user_fee": "6.0"
      }
    ]
  }
```


- Calculate bill for a for a subscription plan
 ```bash
params: {
  id -> number, required, Plan id for which the bill will be calculated
  number_of_user -> number, required, Total number of users will be using the package
  subscription_type -> string, required, 'mothly' or 'yearly'
}

  GET  localhost:3000/plans/2/calculate_bill?number_of_user=100&subscription_type='yearly'
```
The expected response will be
 ```bash
{
    "calculated_amount": "685.0"
}
```

## **Tests**
- To run the Tests

  ```bash
    bundle exec rspec
  ```