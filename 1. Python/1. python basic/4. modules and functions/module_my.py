def find_gcd(number1,number2):
    
    factors1 = []

    start1 = 1

    while start1 <= number1 :

        if number1%start1 == 0:

            factors1.append(start1)

            start1 += 1
        else:

            start1 += 1

    factors2 = []

    start2 = 1

    while start2 <= number2:

        if number2%start2 == 0:

            factors2.append(start2)
            start2 += 1

        else:

            start2 += 1



    # comparing both list

    intesectrion_list = list(set(factors1).intersection(factors2))

    gcd = intesectrion_list[-1]

    return print(f'GCD : {gcd}')
    


   

import math

def trigno_cal(input_1):

    sine = math.sin(input_1)
    cos = math.cos(input_1)
    tan = math.tan(input_1)

    print(f'Sin : {sine}')
    print(f'cosine : {cos}')
    print(f'Tan : {tan}')


def fibo(num):

    fibo_list = [0,1]

    while len(fibo_list) <= num:

        fibo_elem = fibo_list[-1] + fibo_list [-2]

        fibo_list.append(fibo_elem)

    return print(fibo_list[-1])



def sum_natural(n):

    start = 1
    sum = 0
    while start<= n:

        sum = sum + start
       
        start += 1

    return print(sum)