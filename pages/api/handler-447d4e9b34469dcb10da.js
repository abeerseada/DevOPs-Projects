export default function handler(req, res) {
  res.status(200).json({
    message: "447d4e9b34469dcb10da",
    timestamp: new Date().toISOString(),
  });
}