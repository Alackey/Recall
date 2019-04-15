from reminder import getReminder

def test_getReminder_Handler():
    input = {'value1': 'John', 'value2': 'Smith'}
    resp = getReminder.getReminder_handler(input, None)
    assert input['value1'] in resp['message']