# ft_server

To build:

    docker build . -t ft_server
To run:

    docker run -it -p 80:80 -p 443:443 ft_server
Need to turn off Nginx's autoindex? Inside the container's shell, in the root directory, run:

    sh autoindex_off.sh
## Description
This project creates a Docker container on Debian Buster, using an Nginx server. This server run multiples services: Wordpress, phpMyAdmin, and a SQL database. It's not configured in the most safe way as it's purpose is merely academic and demonstrative of containers advantages on microservices.

The container is intended to start attached and on a bash shell so that the process doesn't finish. **If needed to deattach, you can safely do so by pressing "Ctrl" + "pq"** and the process will run in the background.