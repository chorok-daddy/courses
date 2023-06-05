import telegram
import asyncio

bot_token = 'YOUR_TOKEN'
bot = telegram.Bot(token = bot_token)

async def get_updates():
    updates = await bot.getUpdates()
    return updates

async def send_message(my_chat_id, message):
    await bot.sendMessage(chat_id = my_chat_id, text=message)

updates = asyncio.run(get_updates())

if updates[-1].message is not None:
    my_chat_id = updates[-1].message['from']['id']
    print(my_chat_id)
    asyncio.run(send_message(my_chat_id, 'MESSAGE'))

if updates[-1].channel_post is not None:
    channel_id = updates[-1].channel_post.chat.id
    print(channel_id)
    asyncio.run(send_message(channel_id, 'CHANNEL_MESSAGE'))

