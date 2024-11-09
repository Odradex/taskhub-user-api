# TaskHub User API

Service for managing users in the TaskHub project.

## Features

- User registration
- User authentication
- User profile management
- Password reset

## Getting Started

To get started with the TaskHub User API, follow these steps:

1. Clone the repository:
  ```sh
  git clone https://github.com/yourusername/taskhub-user-api.git
  ```
2. Install dependencies:
  ```sh
  cd taskhub-user-api
  bundle install
  ```
3. Set up the database:
  ```sh
  rails db:setup
  ```
4. Start the development server:
  ```sh
  rails server
  ```

## API Endpoints

### User Registration

- **Endpoint:** `/api/register`
- **Method:** `POST`
- **Description:** Register a new user.
- **Request Body:**
  ```json
  {
    "username": "string",
    "email": "string",
    "password": "string"
  }
  ```

### User Authentication

- **Endpoint:** `/api/login`
- **Method:** `POST`
- **Description:** Authenticate a user.
- **Request Body:**
  ```json
  {
    "email": "string",
    "password": "string"
  }
  ```

### User Profile

- **Endpoint:** `/api/profile`
- **Method:** `GET`
- **Description:** Get user profile information.

### Password Reset

- **Endpoint:** `/api/reset-password`
- **Method:** `POST`
- **Description:** Reset user password.
- **Request Body:**
  ```json
  {
    "email": "string",
    "new_password": "string",
    "reset_token": "string"
  }
  ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
