// lib/data/dummy_data.dart

import '../models/food_item.dart'; // Import the FoodItem model

// --- Dummy Data for Food Items ---
// These items will be displayed in the horizontal scroll lists.
// The 'name' field is used by the FoodCard to search for images on Unsplash.
// The 'imageUrl' field is REMOVED because images are fetched dynamically,
// AND the FoodItem model has been updated to make imageUrl optional.
final List<FoodItem> dummyFoodItems = [
   FoodItem(
    id: '3',
    name:
        'Bhelpuri', // Name used for Unsplash search (simplified for better results)
    timeMinutes: 8,
    rating: 4.2,
    reviews: 780,
    description: ['Indian snack', 'Tangy and spicy'],
    price: 99.0,
    isVeg: true,
    // imageUrl is omitted here
  ),
  FoodItem(
    id: '4',
    name: 'Vada Pav', // Name used for Unsplash search (simplified)
    timeMinutes: 8,
    rating: 4.3,
    reviews: 8235,
    description: ['Garlic flavour kick', 'Green chilli on side'],
    price: 65.0,
    isVeg: true,
    // imageUrl is omitted here
  ),
  FoodItem(
    id: '5',
    name: 'Masala Dosa', // Name used for Unsplash search (simplified)
    timeMinutes: 11,
    rating: 4.7,
    reviews: 7528,
    description: ['Home style', 'Served with curd & pickle'],
    price: 129.0,
    isVeg: true,
    // imageUrl is omitted here
  ),
  FoodItem(
    id: '1',
    name: 'Cheese Stuffed Bun', // Name used for Unsplash search
    timeMinutes: 9,
    rating: 4.5,
    reviews: 1124,
    description: ['Soft & cheesy inside', 'Garlic butter flavoured bun'],
    price: 139.0,
    isVeg: true,
    // imageUrl is omitted here, which is now allowed by the model
  ),
  FoodItem(
    id: '2',
    name: 'Chilli Garlic Toast', // Name used for Unsplash search
    timeMinutes: 8,
    rating: 4.8,
    reviews: 4856,
    description: ['Served with ketchup', 'Topped with garlic'],
    price: 159.0,
    isVeg: true,
    // imageUrl is omitted here
  ),
 
  // Add more dummy items here following the same structure.
  // Ensure the 'name' is suitable for an Unsplash search query.
  // Do NOT add imageUrl here anymore.
];

// --- Dummy Data for "What's on your mind?" Categories ---
// These items are for the horizontal category list.
// 'imageUrl' here contains placeholder NETWORK URLs (you can replace these).
// CategoryItem widget USES these URLs directly (doesn't search Unsplash for them).
final List<Map<String, String>> dummyCategories = [
  {
    'name': 'Burgers',
    'imageUrl':
        'https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=400&q=80',
  },
  {
    'name': 'Pizza',
    'imageUrl':
        'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'name': 'Rolls',
    'imageUrl':
        'https://media.istockphoto.com/id/1400110981/photo/mix-vegetable-kathi-roll.jpg?s=2048x2048&w=is&k=20&c=xqSG9Cws66O4MzMdv8avnHqRHDRQOnEM-Lw8ylGjL0o=',
  },
  {
    'name': 'Biryani',
    'imageUrl':
        'https://media.istockphoto.com/id/1410130688/photo/mutton-biryani-served-in-a-golden-dish-isolated-on-dark-background-side-view-indian-food.jpg?s=2048x2048&w=is&k=20&c=3l6KyUCUyNO2w0dJPmN4f2C-YPICegtONfM_7yiB7jg=',
  },
  {
    'name': 'Fries',
    'imageUrl':
        'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?q=80&w=1025&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'name': 'Momos',
    'imageUrl':
        'https://images.unsplash.com/photo-1664990035720-faac522df41f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'name': 'Chowmein',
    'imageUrl':
        'https://media.istockphoto.com/id/2185926548/photo/streetfood-snacks.jpg?s=1024x1024&w=is&k=20&c=PgnpoYlqy3M7UNq6XINczkemV5QkJRIdZ-ibdT32mLY=',
  },
  {
    'name': 'Desserts',
    'imageUrl':
        'https://images.unsplash.com/photo-1551024506-0bccd828d307?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
];



// --- Dummy Data for "Everything Under ₹99" Section ---
// Another list of food items, also relying on FoodCard to fetch images via Unsplash.
final List<FoodItem> dummyUnder99Items = [
  FoodItem(
    id: '99-1',
    name: 'Chocolate Cookie', // Name used for Unsplash search (simplified)
    timeMinutes: 8,
    rating: 4.4,
    reviews: 776,
    description: ['Soft chewy cookie delight', 'A timeless classic treat'],
    price: 49.0,
    isVeg: true,
    // imageUrl is omitted here
  ),
  FoodItem(
    id: '99-2',
    name: 'Oatmeal Cookie', // Name used for Unsplash search (simplified)
    timeMinutes: 8,
    rating: 4.1,
    reviews: 301,
    description: ['Comforting bite of sweetness'],
    price: 49.0,
    isVeg: true,
    // imageUrl is omitted here
  ),
  FoodItem(
    id: '99-3',
    name: 'Virgin Mojito', // Name used for Unsplash search (simplified)
    timeMinutes: 8,
    rating: 4.0,
    reviews: 500,
    description: ['Bold & refreshing', 'Aids digestion'],
    price: 49.0,
    isVeg: true,
    // imageUrl is omitted here
  ),
  FoodItem(
    id: '99-4',
    name: 'Samosa', // Name used for Unsplash search
    timeMinutes: 7,
    rating: 4.6,
    reviews: 1500,
    description: ['Crispy and spicy', 'Served with chutney'],
    price: 35.0,
    isVeg: true,
    // imageUrl is omitted here
  ),
  // Add more items under 99.
  // Do NOT add imageUrl here anymore.
];
