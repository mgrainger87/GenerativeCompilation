from langchain.llms import OpenAI
from langchain.chains import LLMChain
from langchain.chains import ConversationChain
from langchain.memory import ConversationBufferMemory

class LLMQuerier:
	def __init__(self):
		self.llm = OpenAI(
		  model_name="text-davinci-003", # default model
		  temperature=0.9)
		self.conversation = ConversationChain(
			llm=llm, verbose=True, memory=ConversationBufferMemory()
		)
		
	def predict(self, input):
		return conversation.predict(input=input)
