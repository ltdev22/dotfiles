# I. Functions

# use as e.g. exists brew && echo "exists" || echo "not exists"
exist() {
    command -v $1 > /dev/null 2>&1
}