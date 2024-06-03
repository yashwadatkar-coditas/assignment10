
import 'package:assignment10/core/common_widgets/scaffold_navbar.dart';
import 'package:assignment10/features/Home/presentation/pages/home.dart';
import 'package:assignment10/features/auth/presentation/pages/login.dart';
import 'package:assignment10/features/auth/presentation/pages/signup_page.dart';
import 'package:assignment10/features/author_description/presentation/pages/author_description.dart';
import 'package:assignment10/features/author_screen/presentation/pages/author_screen.dart';
import 'package:assignment10/features/book_screen/presentation/pages/book_screen.dart';
import 'package:assignment10/features/books_description/presentation/pages/book_description.dart';
import 'package:assignment10/features/settings/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRoutes 
{
  GoRouter router = GoRouter(
    initialLocation: '/login',
    routes:[

      GoRoute(path: '/login',
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginPage());
        
      },
      routes: [
        GoRoute(path: 'signup',
        pageBuilder: (context, state) {
          return MaterialPage(child: SignUpPage());
        },
        )
      ]
      ),
       StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) {
                  return  MaterialPage(child: Home());
                },

                routes: [
                  GoRoute(path: 'bookdesc',
                  pageBuilder: (context, state) {
                    final Map<String,dynamic> mp = state.extra! as Map<String,dynamic>;

                    return MaterialPage(child: BookDescription(bookDesc: mp["bookDesc"],bookName:mp["bookName"] ));
                  },
                  ),
                  

                  GoRoute(path: 'authordesc',
                  pageBuilder: (context, state) {
                       final Map<String,dynamic> mp = state.extra! as Map<String,dynamic>;
                       
                    return MaterialPage(child: AuthorDescription(authorName: mp['authorName'], authorDesc: mp['authorDesc']));
                  },
                  ),
                ],
               
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/author',
                pageBuilder: (context, state) =>
                    MaterialPage(child: AuthorScreen()),
                 
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/books',
                pageBuilder: (context, state) =>
                     MaterialPage(child: BookScreen()),

                
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/setting',
                pageBuilder: (context, state) =>
                    const MaterialPage(child: SettingsScreen()),
              ),
            ]),
          ],
        ),
    ],);
}