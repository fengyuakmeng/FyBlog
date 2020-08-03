from django.test import TestCase

# Create your tests here.


a = [1,2,3]
b = [12,3]
c = zip(a,b)
for x,y in c:
    print(x,y)