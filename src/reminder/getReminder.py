import json

def getReminder_handler(event, context):
    return {
        'message': f'Hello {event["value1"]} {event["value2"]}'
    }