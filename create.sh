# Author: Kaito
# Github: https://github.com/nekokaito


if [ $# -eq 0 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi


project_name=$1


npm create vite@latest "$project_name" -- --template react


cd "$project_name" || exit

npm install
npm install react-router-dom localforage match-sorter sort-by
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
npm i  daisyui@latest
npm install --save prop-types
npm install react-icons



cat << EOF > tailwind.config.js
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")], 
}
EOF


cat << EOF > index.html
<!doctype html>
<html lang="en" data-theme="light">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>

EOF


cat << EOF > src/index.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF


cat << EOF > src/app.jsx
function App() {
    return (
        <>
       
       {/* Remove From Here */}

        <div className="flex gap-3 mt-3">
        <img className=" w-[100px]" src="https://web.programming-hero.com/home/level2Home/images/logo.svg" alt="" />
        <div>
        <h1 className="text-3xl">ViteTemplate, Tailwind, daisyUI, Prop-types and ReactIcons  <br></br>Installed Successfully</h1>
            <p className="mt-3">Happy Coding!</p>
        </div>
        </div>
            
         {/* Remove From Here */}

        </>
    );
}

export default App;
EOF
rm src/App.css
code .
npm run dev
