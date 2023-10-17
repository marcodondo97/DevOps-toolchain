import unittest
import requests

class TestAPIEndpoint(unittest.TestCase):
    def test_api_endpoint(self):
        endpoint_url = 'http://localhost:5001'

        try:
            response = requests.get(endpoint_url)
            if response.status_code == 200:
                result = "OK"
            else:
                result = "KO"
                #pi
        except Exception as e:
            result = "KO"   
        print(result)

if __name__ == '__main__':
    unittest.main()
