# UAA – User Admin Authentication App

A Ruby on Rails 8 application with Devise for authentication, email confirmation, role-based access (admin/user), profile photo management, and clean UI. Built for secure user interaction and admin control.

---

## 🚀 Features

- ✅ Devise Authentication (Login, Registration, Logout)
- 📧 Email Confirmation
- 🧑‍🎼 Role-Based Access (Admin / User)
- 🖼 Profile Picture Upload with ActiveStorage
- 🛠 Admin Dashboard to:
  - View all users
  - Promote users to admin
  - Delete users
- 👤 Shared profile & edit pages for both users and admins
- 🎯 Redirects and permissions based on role
- ⚡ Turbo, Stimulus, and Importmap integration
- 💎 Clean and responsive interface using Rails best practices

---

## 🛠 Tech Stack

- **Ruby on Rails** 8.0.2
- **Ruby** 3.2+
- **PostgreSQL** for database
- **Devise** for authentication
- **ActiveStorage** for profile images
- **Turbo-Rails**, **Stimulus** for interactivity
- **Cancancan** for role-based permissions
- **Solid Queue, Cache, Cable** for background systems

---

## 📦 Setup Instructions

1. **Clone the Repository**

```bash
git clone https://github.com/your-username/uaa.git
cd uaa
```

2. **Install Dependencies**

```bash
bundle install
```

3. **Set Up the Database**

```bash
rails db:setup
```

4. **Start the Rails Server**

```bash
bin/dev
```

5. **Visit the App**

Open your browser and go to:  
```http://localhost:3000```

---

## 🔐 Admin Access

To log in as admin:

1. Go to the sign-up page and register with any email.
2. In the Rails console, promote the user:

```bash
rails console
```

```ruby
User.last.update(role: :admin)
```

3. Log in and visit the Admin Dashboard at:  
```http://localhost:3000/admin/dashboard```

---

## ✨ Notes

- After logout, users are redirected directly to the login page.
- Navigation bar dynamically updates based on sign-in state.
- Admins and users share the same profile and edit views.

---

## 📁 Folder Structure Highlights

```
app/
├── controllers/
│   ├── admin/
│   │   └── dashboard_controller.rb
│   └── users/ (custom Devise controllers)
├── views/
│   ├── admin/dashboard/
│   ├── users/
│   │   └── profile.html.erb
├── models/
│   └── user.rb (with role enum and avatar)
```

## 👤 Author

**Sakshi Shinde**  
GitHub: [github.com/sds-cpu](https://github.com/sds-cpu)

## 🕓 Deadline

**April 21, 2025**(My Birthday!!!YAYY!!!)



