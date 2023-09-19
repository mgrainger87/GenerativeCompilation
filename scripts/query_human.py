import subprocess
import sys

def copy_to_pasteboard(text: str) -> None:
	"""
	Copy the provided text to the macOS pasteboard using pbcopy.
	"""
	process = subprocess.Popen('pbcopy', universal_newlines=True, stdin=subprocess.PIPE)
	process.communicate(text)
	process.wait()

class HumanQuerier:
	def performQuery(self, prompt):
		print(prompt)
		copy_to_pasteboard(prompt)
		lines = []
		try:
			for line in sys.stdin:
				line = line.strip()
				lines.append(line)
		except EOFError:
			pass
		print(lines)
		return "\n".join(lines)
