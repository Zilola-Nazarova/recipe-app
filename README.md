<h3 align="center"><b>Recipe App</b></h3>

<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)


# 📖 Recipe App <a name="about-project"></a>

The **Recipe app** keeps track of all your recipes, ingredients, and inventory. It will allow you to save ingredients, keep track of what you have, create recipes, and generate a shopping list based on what you have and what you are missing from a recipe. Also, since sharing recipes is an important part of cooking the app should allow you to make them public so anyone can access them.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://developer.mozilla.org/ru/docs/Web/HTML">HTML</a></li>
    <li><a href="https://developer.mozilla.org/ru/docs/Web/CSS">CSS</a></li>
    <li><a href="https://developer.mozilla.org/ru/docs/Web/JavaScript">JavaScript</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>


### Key Features <a name="key-features"></a>

- **read public recipes and their ingredients**
- **authentication and authorization**
- **add/delete foods**
- **add/delete recipes**
- **add/edit/delete ingredients**
- **make a recipe private/public**
- **generate shopping list**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🚀 Live Demo <a name="live-demo"></a>

- The Live Demo: https://recipe-app-mii4.onrender.com/

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- GitHub account;
- Git installed on your OS;
- VSCode (or another code editor);
- modern browser (supporting HTML5 and CSS3) is highly recommended;
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) installed;
- [Ruby on Rails](https://gorails.com/guides) installed;
- [Node.js and npm](https://nodejs.org/) installed.

### Setup

Clone this repository to your desired folder:

Login to your GitHub account. Clone this repository to your desired folder:

> cd my-folder
> git clone git@github.com:Zilola-Nazarova/recipe-app.git

Setup database:
> sudo -u postgres createuser --interactive --pwprompt
(provide the username and password described in [config/database.yml](./config/database.yml))

### Install

Install the dependencies:
> gem install
> npm install

Create database:
> bin/rails db:create

(OPTIONAL) Fill the database with sample records:
> bin/rails db:seed

### Usage

To run the server:
> rails server

Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

### Run tests

To run tests, run the following command:
> rspec

You can also check linter errors by running these commands:
> rubocop

(OPTIONAL) For testing the confirmation emails:
> gem install mailcatcher

Open [http://localhost:1080](http://localhost:1080) to view it in your browser.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Authors <a name="authors"></a>

👤 **Zilola Nazarova**

- GitHub: [@Zilola-Nazarova](https://github.com/Zilola-Nazarova)
- LinkedIn: [in/NazarovaZi](https://www.linkedin.com/in/zilola-nazarova)
- Twitter: [@NazarovaZi](https://twitter.com/NazarovaZi)

👤 **Anshuman Negi**

- GitHub: [@anshuman7negi](https://github.com/anshuman7negi)
- LinkedIn: [Anshuman singh Negi](https://www.linkedin.com/in/anshuman-singh-negi-33779a224/)
- Twitter: [@AnshumanNegi108](https://twitter.com/AnshumanNegi108)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>

- [ ] **add inventories list (with all CRUD implementation)**
- [ ] **add food list for a given inventory (with all CRUD implementation)**
- [ ] **add inventory shopping list, a shopping list, but only taking into consideration a chosen recipe and inventory**
- [ ] **improve UX/UI design**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

If you like this project just star it!

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to thank the Microverse program for the knowledge and skills we have acquired in Modules 1-5.

We are grateful to all previous project reviewers for their advice. Thanks to them we could build this app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
