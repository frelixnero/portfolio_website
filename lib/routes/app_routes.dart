import 'package:go_router/go_router.dart';
import 'package:portfolio_website/pages/abou_page.dart';
import 'package:portfolio_website/pages/blog_page.dart';
import 'package:portfolio_website/pages/home_page.dart';
import 'package:portfolio_website/pages/projects_page.dart';

class Routes {
  static const home = '/';
  static const projects = '/projects';
  static const blog = '/blog';
  static const about = '/about';
}

class AppRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,

        pageBuilder:
            (context, state) => const NoTransitionPage(child: HomePage()),
      ),
      GoRoute(
        path: Routes.projects,
        pageBuilder:
            (context, state) => const NoTransitionPage(child: ProjectsPage()),
      ),
      GoRoute(
        path: Routes.blog,
        pageBuilder:
            (context, state) => const NoTransitionPage(child: BlogPage()),
      ),
      GoRoute(
        path: Routes.about,
        pageBuilder:
            (context, state) => const NoTransitionPage(child: AboutPage()),
      ),
    ],
  );
}
