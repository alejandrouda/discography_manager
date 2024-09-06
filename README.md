# Discography Manager

A Rails application to manage artists, LPs, built on an intuitive dashboard.

## Features

- CRUD operations for artists and LPs.
- Filtering LPs by artist.
- Reporting with required data.

## Prerequisites

Before running the application, ensure you have the following installed:

- **Ruby** (version 3.1.0 or later)
- **Rails** (version ~> 7.0.8, >= 7.0.8.4)
- **Yarn** (for managing JavaScript dependencies)
- **SQLite3** (version ~> 1.4)

## Associations

- **Artist** and **LP** are in a one-to-many relationship: one Artist has many LPs, and one LP belongs to one Artist.
- One **LP** has many **songs**.
- One **song** belongs to many **Authors**, and one **Author** has many **Songs**.

## Database Structure

![Database Structure](https://github.com/user-attachments/assets/2c8c3d03-4a40-41de-80dd-b7a25cbc54f3)

## Setup

### Clone the Repository

```
git clone https://github.com/your-username/discography-manager.git
cd discography-manager
```

## Install Dependencies

### Install Ruby gems:

```
bundle install
```

### Install JavaScript dependencies:

```
yarn install
```

## Configure the Database
### Create and setup the database:

```
rails db:create
rails db:migrate
rails db:seed
```

## Run the Application
### Start the Rails server:

```
rails server
```

## Visit the application in your browser:


Open http://localhost:3000 to see the application running locally.


