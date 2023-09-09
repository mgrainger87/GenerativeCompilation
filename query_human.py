import subprocess

def copy_to_pasteboard(text: str) -> None:
	"""
	Copy the provided text to the macOS pasteboard using pbcopy.
	"""
	process = subprocess.Popen('pbcopy', universal_newlines=True, stdin=subprocess.PIPE)
	process.communicate(text)

class HumanQuerier:
	def generateAssembly(self, prompt):
		print(prompt)
		copy_to_pasteboard(prompt)
		lines = []
		try:
			while True:
				line = input()
				lines.append(line)
		except EOFError:
			pass
			
		return "\n".join(lines)

