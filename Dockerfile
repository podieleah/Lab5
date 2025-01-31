FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html

COPY index.html . 

# index.html content
# ---
# <html>
# <head>
#     <title>Hello Jenkins!</title>
# </head>
# <body>
#     <h1>Hello Jenkins!</h1>
#     <p>Secret Variable: ${SECRET_VAR}</p> 
# </body>
# </html>
# ---
