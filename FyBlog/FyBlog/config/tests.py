from django.test import TestCase

# Create your tests here.


class B:

    def testb(self):
        return 1


class A(B):
    print(2)


a = A()
print(a.testb())

