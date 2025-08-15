export default function handler(req, res) {
  res.status(200).json({
    message: "5714979c8440a1513084",
    timestamp: new Date().toISOString(),
  });
}