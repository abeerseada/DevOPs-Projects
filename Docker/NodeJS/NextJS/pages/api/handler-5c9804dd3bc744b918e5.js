export default function handler(req, res) {
  res.status(200).json({
    message: "5c9804dd3bc744b918e5",
    timestamp: new Date().toISOString(),
  });
}