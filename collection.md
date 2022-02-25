# See all endpoints and your outputs.

## User Endpoints

### GET http://localhost:4000/api/users/:id

```json
    {
        "cpf": "12345678911",
        "email": "email",
        "id": "uuid",
        "meals": [
            {
                "calories": 300,
                "description": "launch",
                "id": "uuid",
                "user": "uuid"
            }
        ],
        "name": "user name"
    }
```

### GET http://localhost:4000/api/users

```json
    {
    "data": [
        {
            "cpf": "12345678911",
            "email": "email",
            "id": "uuid",
            "meals": [
                {
                    "calories": 300,
                    "description": "launch",
                    "id": "uuid",
                    "user": "uuid"
                }
            ],
            "name": "user name"
        }
    ]
}
```


### POST http://localhost:4000/api/users

```json
    {
        "message": "User Created",
        "user": {
            "cpf": "12345678911",
            "email": "email",
            "id": "uuid",
            "name": "user name"
        }
    }
```

### PUT http://localhost:4000/api/users

```json
    {
        "id": "uuid",
        "name": "user Name",
        "cpf": "user cpf",
        "email": "user email"
    }
```

### DELETE http://localhost:4000/api/users/:id

```json
    no content
```

## Meal Endpoints

### GET http://localhost:4000/api/meals/:id

```json
    {
        "calories": 300,
        "description": "launch",
        "id": "uuid",
        "user": "uuid"
    }
```

### GET http://localhost:4000/api/meals

```json
  {
    "data": [
        {
            "calories": 300,
            "description": "launch",
            "id": "uuid",
            "user": "uuid"
        }
    ]
  }
```

### POST http://localhost:4000/api/meals

```json
   {
        "description": "breakfast", 
        "calories": 300
   }
```

### PUT http://localhost:4000/api/meals

```json
   {
        "calories": 500,
        "description": "breakfast",
        "id": "uuid"
   }
```

### DELETE http://localhost:4000/api/meals/:id

```json
   no content
```