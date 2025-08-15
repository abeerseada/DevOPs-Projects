export default function handler(req, res) {
  res.status(200).json({
    message: "1b455f2499d62d462984",
    timestamp: new Date().toISOString(),
  });
}