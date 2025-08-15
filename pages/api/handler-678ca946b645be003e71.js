export default function handler(req, res) {
  res.status(200).json({
    message: "678ca946b645be003e71",
    timestamp: new Date().toISOString(),
  });
}