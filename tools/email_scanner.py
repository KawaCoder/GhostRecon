import requests

class ChecK():

    def __init__(self):
        self.email = str(input("Enter Email: "))
        self.twitter()

    def PrintT(self):
        print(f"{self.email} = Linked"+"\n")

    def PrintF(self):
        print(f"{self.email} = Unlinked"+"\n")

    def twitter(self):
        print("[+] Twitter [+]")
        print("")
        r = requests.Session()
        url = "https://api.twitter.com/i/users/email_available.json?email="+self.email
        user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36"
        Host = "api.twitter.com"
        Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        r.headers = {'User-Agent': user_agent}
        r.headers = {'Host': Host}
        r.headers = {'Accept': Accept}
        req = r.get(url).json()
        text = str(req)
        if text.find("'valid': False") == True:
            self.PrintT()
        else:
            self.PrintF()
        self.instagram()

    def instagram(self):
        print("[+] Instagram [+]")
        r = requests.Session()
        url = "https://www.instagram.com/accounts/account_recovery_send_ajax/"
        user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36"
        r.headers = {'user-agent': user_agent}
        r.headers.update({'X-CSRFToken': "missing"})
        data = {"email_or_username":self.email}
        req = r.post(url,data=data)
        print('')
        if req.text.find("We sent an self.email to")>=0:
            self.PrintT()
        elif req.text.find("password")>=0:
            self.PrintT()
        elif req.text.find("sent")>=0:
            self.PrintT()
        else:
            self.PrintF()
        self.strava()

    def strava(self):
        print("[+] Strava [+]")
        print("")
        url = "https://www.strava.com/frontend/athletes/email_unique"
        params = {
            "email": self.email
        }
        headers = {
            "Accept": "application/json"
        }
        response = requests.get(url, headers=headers, params=params)
        if(response.status_code==200):
            # print("Response ok")
            if(response.json()==False):
                self.PrintT()
            elif(response.json()==True):
                self.PrintF()
            else:
                print(response.json())
        else:
            print("error: ", response.status_code)

        self.snacphat()

    def snacphat(self):
        print("[+] Snapchat [+]")
        print("")
        r = requests.Session()
        url = "https://accounts.snapchat.com/accounts/merlin/login"
        r.headers = {
        'Host': 'accounts.snapchat.com',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Encoding': 'gzip, deflate, br',
        'X-XSRF-TOKEN': 'missing',
        'Content-Type': 'application/json',
        'Origin': 'https://accounts.snapchat.com',
        'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148',
        'Connection':'keep-alive',
        'Referer': 'https://accounts.snapchat.com/accounts/merlin/login'
        }
        cookies = {
        'xsrf_token':'missing'
        }
        data = {
        'email':self.email,
        'app':'BITMOJI_APP'
        }
        req = r.post(url, cookies=cookies, json=data)
        #print(req.text) # If the response is blank, it means Unlinked .
        print('')
        if req.text.find("hasSnapchat") >= 0 :
            self.PrintT()
        else:
            self.PrintF()

if __name__ == "__main__":
    ChecK()


print('')
print('Press enter to exit .')
input('')
