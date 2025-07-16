# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy solution and restore
COPY MyCrudApp.sln ./
COPY MyCrudApp/*.csproj ./MyCrudApp/
RUN dotnet restore MyCrudApp.sln

# Copy the rest of the code and publish
COPY . ./
WORKDIR /src/MyCrudApp
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "MyCrudApp.dll"]
