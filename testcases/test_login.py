import pytest
from selenium import webdriver
from pageobjects.loginpage import LoginPage
import time


class Test_001_Login:
    baseURL = "https://demo.nopcommerce.com/login?returnUrl=%2F"
    username = "p.kamalbasha1998@gmail.com"
    password = "kamalbasha"


    def test_homePage(self):
        self.driver = webdriver.Chrome(executable_path="C:\driver\chromedriver.exe")
        self.driver.maximize_window()
        self.driver.get(self.baseURL)
        time.sleep(5)
        act_title=self.driver.title
        # self.driver.close()
        if act_title=="nopCommerce demo store. Login":
            assert True
        else:
            assert False

    def test_login(self):
        self.driver = webdriver.Chrome(executable_path="C:\driver\chromedriver.exe")
        self.driver.get(self.baseURL)
        time.sleep(10)
        self.lp=LoginPage(self.driver)
        self.lp.setUserName(self.username)
        self.lp.setPassword(self.password)
        self.lp.clickLogin()
        act_title=self.driver.title
        # self.driver.close()
        time.sleep(5)
        if act_title == "nopCommerce demo store":
            assert True
        else:
            assert False
