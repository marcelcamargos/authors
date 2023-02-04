# Author

Marcel Gonçalves Viana Marins de Camargos

# Short explanation

Implementations are based on this API: https://jsonplaceholder.typicode.com

Below are some of the implementations I made.

1. Load the posts from the JSON API and populate the view.
2. Each cell/row shows the title of the post without clipping ( dynamic height ).
3. Once a Post is tapped, the user is taken to a Post Details Screen.
4. The post details screen contains: the post title and description; the post author information; the list of comments.
5. I implemented a mechanism to favorite/unfavorite a post. Favorite posts should be at the top of the list. Favorite posts should have a filled star indicator.
6. I implemented offline access to posts screen.
7. I implemented offline access to post details screen.
8. I implemented a mechanism to remove all posts except from the favorites ones.


# I used Clean Swift Architecture (VIP) as illustrated below


![image](https://user-images.githubusercontent.com/19171477/216327968-ded1ba67-8aae-40a6-9a5b-e369ed764786.png)


# This is the initial screen I created

After you start the app, this screen is shown. As you can see, some posts are marked as favourite. To mark it as favourite, you need to click the row and go to the details screen.

Also, as you can see, there is a menu called Delete All. If you are offline, you can delete all records except those marked as favourites. The deletion is done in core data tables.

![image](https://user-images.githubusercontent.com/19171477/216733803-9e2b604c-8406-40ab-aca8-8a327885a7a2.png)


# This is the detail screen I created

When you clicked the row in the last screen, you see this screen. In the top of the screen, there is an option called "Mark as Favourite". If you click that, this post becomes a favourite with a filled star.

In the bottom of the screen, there is a list of comments. You can scroll it if there are many comments.

Finally, there is a menu called Delete from where you can delete the post through a backend call.

![image](https://user-images.githubusercontent.com/19171477/215658141-b73c7305-14a4-4f0c-9887-28112ef95e00.png)

