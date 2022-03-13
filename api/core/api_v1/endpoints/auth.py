from fastapi import APIRouter
import jwt

router = APIRouter()


@router.get('/test_auth')
def test():
    encoded_jwt = jwt.encode(
        {
            'id': 1,
            'name': 'bang'
        },
        'token',
        algorithm='HS256'
    )
    return {'msg': encoded_jwt}