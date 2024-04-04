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
npm install firebase
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


cat << EOF > src/main.jsx
import React from 'react'
import ReactDOM from 'react-dom/client'

import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import './index.css'

const router = createBrowserRouter([
  {
    path: "/",
    element: <div>Hello world!</div>,
  },
]);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    
    <RouterProvider router={router} />
    
  </React.StrictMode>,
)

EOF
rm src/App.css
rm src/App.jsx
code .
npm run dev
