class AppStrings {
  static const String aboutTitle =
      '''Ogene Osita Felix (Full Stack Mobile Developer | Python , Flutter, Kotlin Expert)''';

  static const String aboutDescription =
      '''I am a results-driven Flutter & Python Developer with 3+ years of experience delivering high-quality, cross-platform
mobile applications and robust backend services. I specialize in Flutter (Dart) and Python (FastAPI, Flet), with hands-
on expertise in Firebase, Hive, and PostgreSQL. I’ve successfully built and deployed applications integrating REST
APIs, authentication flows, and scalable state management using patterns like MVVM and frameworks such as Bloc,
Provider, and Riverpod.
I excel in collaborating with UI/UX teams to transform designs into seamless user experiences and thrive in agile
environments, consistently delivering maintainable, production-ready code. Passionate about creating products that
merge solid engineering with intuitive design, I aim to build solutions that make real-world impact''';

  static const String foodProjectDesc =
      '''Developed a robust, end-to-end delivery platform using Flutter, featuring specialized interfaces for both clients and administrators. The system streamlines the entire food ordering lifecycle—from menu browsing and secure checkout to real-time logistical tracking. By bridging a FastAPI backend with Firebase and Google Maps API, the application provides a seamless, high-performance experience that rivals industry-standard delivery services.''';

  static const String voicePlatformDesc =
      '''An ElevenLabs-inspired AI text-to-speech platform pairing a Next.js application layer with a Python/FastAPI inference backend powered by a fine-tuned StyleTTS2 model. A custom voice dataset was created from recorded speech data, and a FastAPI inference engine exposes high-quality text-to-speech through backend APIs. The AI inference environment is containerized with Docker and published to Amazon ECR, with an AWS workflow using EC2 for model fine-tuning, S3 for artifact storage, and IAM-controlled service access. The architecture cleanly separates the user-facing platform from the inference engine and model infrastructure. (In development)''';

  static const String nodelineDesc =
      '''A full-stack workflow automation platform inspired by n8n and Zapier, combining a visual node-based editor with event-driven execution and persistent workflow management. The canvas uses React Flow and Toposort for DAG validation, cycle detection, and topological sorting to guarantee correct execution ordering. Client-server communication is fully type-safe via tRPC and TanStack Query, while an Inngest-powered background engine offloads webhooks and multi-step node executions off the main thread. Authentication runs through Better Auth with server-component session checks, and Prisma with Neon Serverless PostgreSQL persists workflow graphs, execution logs, and sessions. The platform is monetized via Polar and leverages the Vercel AI SDK with Google Gemini for intelligent, LLM-driven workflow steps. (02/2026 – Present)''';

  static const String payStackDesc =
      '''Designed and deployed a specialized fintech backend service using FastAPI to facilitate secure digital transactions for a Flutter-based delivery ecosystem. This project serves as a dedicated middleware, bridging the gap between mobile client requests and the Paystack API. By implementing automated verification and real-time webhook listeners, the system ensures that every transaction—from initialization to settlement—is processed with high integrity and minimal latency.''';

  static const String fastApiDesc =
      '''A high-performance, scalable Social Media REST API built with FastAPI and PostgreSQL. This project focuses on implementing industry-standard security practices, including JWT-based authentication and Role-Based Access Control (RBAC). The backend manages complex data relationships for users, posts, and interactive voting systems, ensuring data integrity through a strictly modeled relational database and automated migrations with Alembic.''';

  static const String desktopDatabaseDesc =
      '''Engineered a custom desktop database management system specifically designed to digitize and streamline the administrative workflows of a modern law firm. Built using Python and the Flet framework, the application provides a high-performance interface for managing complex legal contact records. The solution transitions the firm from manual record-keeping to a centralized, searchable SQLite database, complete with professional reporting features and rigorous data validation.''';

  static const String fleetDesc =
      '''Architected and deployed a sophisticated fleet management ecosystem comprising a high-performance mobile application for commuters/drivers and a robust desktop administrative dashboard. The system leverages Flutter and Dart to provide a seamless cross-platform experience, solving the critical challenge of real-time transit visibility. By integrating Open Street Maps and Firebase, the solution offers end-to-end logistics oversight—from precise live location tracking to secure, role-based fleet administration. ''';
}
