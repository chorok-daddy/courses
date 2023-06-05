from telegram.ext import Application, CommandHandler
import asyncio

bot_token = '[YOUR_TOKEN]'

async def give_me_a_photo(update, context) :
    await context.bot.send_document(chat_id=update.message.chat.id, 
                                    document=open('photo.png', 'rb'), 
                                    filename='photo.png')

application = Application.builder().token(bot_token).build()
application.add_handler(CommandHandler('photo', give_me_a_photo))
application.run_polling()