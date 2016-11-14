## joeycody.com
Personal site built with [Middleman](https://middlemanapp.com/).

### Development
To create local copy:

```shell
$ bundle exec middleman build
```
Static site should have been generated in the `/tmp` directory. Preview with `$ open tmp/index.html`.

### Deployment
Heroku should be added as a git remote url. Then a quick:

```shell
$ git push heroku master
```

should force heroku to run the ruby app and compile the middleman static site. Hopefully [joeycody.herokuapp.com](https://joeycody.herokuapp.com) isn't too broken.

### Renewing SSL-Cert

Currently using a free SSL certificate from [Let's Encrypt](https://letsencrypt.org/). The certificate is valid for 90-days by default, and thus must be renewed to remain valid. The [Certbot](https://certbot.eff.org/) homebrew package makes that easy:

```shell
$ sudo certbot certonly --manual -d joeycody.com
```
