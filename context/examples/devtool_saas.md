# Software/SaaS Product Brief

**Product Name:** MigraCheck

## 1. The Problem
Database migrations in CI/CD pipelines frequently fail silently, causing downtime in production. Developers merge PRs with destructive schema changes, or write migrations that lock tables for too long, breaking the live application.

## 2. Target Developer/User
Backend engineers and DevOps/Platform engineers working on high-traffic Postgres and MySQL databases who are tired of manual DBA reviews blocking their deployments.

## 3. Tech Stack / Ecosystem
PostgreSQL, MySQL. Integrates directly into GitHub Actions and GitLab CI. Written in Go.

## 4. Pricing Model
Open-source CLI tool for local testing. 
Cloud offering: $49/mo per repository for the automated CI/CD gating and history tracking.

## 5. Known Competitors
Prisma (indirectly), Atlas (direct), PlanetScale (indirect, as they handle this but require moving to their DB), Liquibase (enterprise/legacy).
