def error_handl(a,b):

    if type(a) != int or type(b) != int:

        raise Exception("Please enter valid integer input")

    elif a == b:

        raise Exception("Please enter valid range, both input can not be same")

    elif a > b :

        raise Exception('Range can not be reverse')

    else:

        return a,b


def even_range():

    try:
        inp1 = int(input('Please enter number 1'))
        inp2 = int(input('Please enter number 2'))

        a, b = error_handl(inp1, inp2)

        list_number = range(a, b + 1)
        even_list = []
        for num in list_number:

            if num % 2 == 0:

                even_list.append(num)

            else:

                pass

        return even_list

    except ValueError as ex:

        print(f'Error : {ex}')


    except Exception as ex:

        print(ex)

