import http.server, socketserver, os

PORT = 7432
DIR  = "/Users/usuario/Desktop/promp app/promptbuilder_export"

os.chdir(DIR)

class Handler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, *a): pass

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    httpd.serve_forever()
