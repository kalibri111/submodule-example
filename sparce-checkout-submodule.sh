function git_sparse_clone() (
  rurl="$1" localdir="$2" rbranch="$3" && shift 3

  mkdir -p "$localdir"
  cd "$localdir"

  git init
  git remote add origin "$rurl"

  git config core.sparseCheckout true

  # Loops over remaining args
  for i; do
    echo "$i" >> .git/info/sparse-checkout
  done

  echo "Cloning from remote"

  git pull origin $rbranch
)

git_sparse_clone "https://github.com/tensorflow/tensorflow" "./tensorflow-contrib" "r1.14" "/tensorflow/contrib/"

echo "Cloned sparse module"

cd tensorflow-contrib

git remote add myrepo "https://github.com/kalibri111/tensorflow-contrib"

echo "Added remote git repository"

git push -u myrepo main

echo "Pushed to remote"
