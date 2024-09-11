# Wordpress-Lazy-Permsetter

Quickly set proper permissions and file ownership of a Wordpress instance in 5 seconds or less.

## What does it do?
1. It asks you what Linux directory your wordpress is
2. It asks you what user your webserver or PHP-FPM is
3. It asks you what group your webserver or PHP-FPM is
4. It sets your ownership of your wordpress and all child folders to your desired group and user
5. It sets all correct file perms to 644
6. It set all correct directory perms to 755
7. It sets wp-config.php to 600
8. It finishes

## Why does it do it?

I got tired of seeing Wordpress instances with incorrect file and directory permissions as the result of lazy admins who don't care about basic Wordpress security, or don't know about basic Wordpress security, so I made this script so that anyone can set their permissions according to Wordpress basic practices. This is my Lazy Wordpress Permsetter, there are many others like it, but this one is mine.

## I am extra lazy, and don't want to clone an entire repo, what do?

No worries, you can just copy and paste this command into your terminal (root access is required):

```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackPala/Wordpress-Lazy-Permsetter/main/permsetter.sh)"
```

**Note:** I am not responsible for whatever you do with this, it's like 10 lines of bash so you should probably read it before running it to make sure it will do what you want, how you want it. 
