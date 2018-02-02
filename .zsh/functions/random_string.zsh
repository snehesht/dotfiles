# Prints a random string for password
randstr()
{
	base64 /dev/urandom | head -c $1
}
